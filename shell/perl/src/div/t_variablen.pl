# test variable
$Var1 = "Andreas";
$Var2 = 15;

# test array
@Var3=("Andreas ","Peter ","Heinz");

# test hash
%var3=();
$var3{"MO"}="MONTAG";

%Woche = (
	"MO" => "Montag",
	"DI" => "Dienstag");
$Woche{"MI"}="Mittwoch";

# und ausdrucken

print "\nGuten Morgen, Welt und $Var1 und Var2=$Var2\n";
print @Var3; print " $Var3[0]";
print "$Woche{'MI'}.\n", "var 3 = $var3{'MO'}\n";