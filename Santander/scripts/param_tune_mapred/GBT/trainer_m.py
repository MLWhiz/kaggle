import sys

for line in sys.stdin:
	record = line.strip()
	for i in range(0,1000):
		print "%s\t%s" %(i, record)
