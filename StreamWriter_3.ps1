cls

# System.IO.StreamWriter - funguje
# pri znovu spusteni prepise komplet starej soubor

$path = "R:\file.txt"

$stream = [System.IO.StreamWriter]::new($path)

for ($aa = 1; $aa -le 10; $aa++) {
$rnd=Get-Random
echo $rnd
$stream.WriteLine("$rnd")
}

$stream.close()

