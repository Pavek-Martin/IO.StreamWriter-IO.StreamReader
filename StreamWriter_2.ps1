
cls


$path = "R:\aax.txt"

$stream = [System.IO.StreamWriter]::new($path)

foreach ($p in (1..10)) {
$stream.WriteLine("$p")
echo $p
}

$stream.close()

