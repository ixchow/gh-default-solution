#!/usr/bin/perl -w
print('console.log("');
$first = 1;
while($line = <>) {
	if ($first) {
		$first = 0;
	} else {
		print("\\n");
	}
	chomp($line);
	print($line);
}
print("\");\n");
