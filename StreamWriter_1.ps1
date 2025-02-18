
cls


$path = "R:\aax.txt"

$stream = [System.IO.StreamWriter]::new($path)

foreach ($p in (1..1000)) {
$stream.WriteLine("$p")
echo $p
}

$stream.close()

