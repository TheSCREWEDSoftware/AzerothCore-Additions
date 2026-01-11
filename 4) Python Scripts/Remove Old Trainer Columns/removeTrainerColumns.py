
import re
import os
import sys
import difflib

FIELDS_TO_REMOVE = [
	'trainer_type',
	'trainer_spell',
	'trainer_class',
	'trainer_race',
]

def get_new_filename(base):
	if not os.path.exists(base):
		return base
	name, ext = os.path.splitext(base)
	i = 1
	while True:
		new_name = f"{name}_{i}{ext}"
		if not os.path.exists(new_name):
			return new_name
		i += 1

def process_sql(sql_text):
	pattern = re.compile(r'((INSERT(?:\s+IGNORE)?|DELETE)\s+INTO|DELETE FROM)\s+`creature_template`\s*(\((.*?)\))?(\s+VALUES)?(.*?;)', re.DOTALL | re.IGNORECASE)
	def repl(match):
		statement_type = match.group(1).strip().upper()
		table = match.group(0)
		columns_part = match.group(3)
		columns = match.group(4)
		values_kw = match.group(5) or ''
		values = match.group(6) or ''
		if statement_type.startswith('INSERT') and columns:
			cols = [c.strip(' `') for c in columns.split(',')]
			idxs = [i for i, c in enumerate(cols) if c not in FIELDS_TO_REMOVE]
			new_cols = [f'`{cols[i]}`' for i in idxs]
			value_tuples = re.findall(r'\(([^;]*?)\)', values)
			new_values = []
			for tup in value_tuples:
				vals = []
				cur = ''
				in_str = False
				for ch in tup:
					if ch == "'":
						in_str = not in_str
					if ch == ',' and not in_str:
						vals.append(cur.strip())
						cur = ''
					else:
						cur += ch
				vals.append(cur.strip())
				new_vals = [vals[i] for i in idxs]
				new_values.append(f"({', '.join(new_vals)})")
			return f"INSERT INTO `creature_template` ({', '.join(new_cols)}){values_kw}\n" + ',\n'.join(new_values) + ';'
		else:
			return match.group(0)
	return pattern.sub(repl, sql_text)

def main():
	if len(sys.argv) < 2:
		print("Usage: python removeTrainerColumns.py <input.sql>")
		sys.exit(1)
	input_file = sys.argv[1]
	with open(input_file, 'r', encoding='utf-8') as f:
		original = f.read()
	modified = process_sql(original)
	out_file = get_new_filename(input_file)
	with open(out_file, 'w', encoding='utf-8') as f:
		f.write(modified)
	diff_file = out_file + '.diff'
	with open(diff_file, 'w', encoding='utf-8') as f:
		for line in difflib.unified_diff(
			original.splitlines(keepends=True),
			modified.splitlines(keepends=True),
			fromfile=input_file,
			tofile=out_file
		):
			f.write(line)
	print(f"Modified file: {out_file}\nDiff file: {diff_file}")

if __name__ == '__main__':
	main()