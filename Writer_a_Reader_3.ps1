cls

# System.IO.StreamWriter - funguje
# pri znovu spusteni prepise komplet starej soubor


$path_input_otput_file = "R:\file.txt"
#$path_output_file = "R:\file.txt"

#$stream_writer = [System.IO.StreamWriter]::new($path_output_file)
$stream_writer = [System.IO.StreamWriter]::new($path_input_otput_file)


echo "-----write file-----"

for ($aa = 1; $aa -le 10; $aa++) {
$rnd=Get-Random
echo $rnd
$stream_writer.WriteLine("$rnd")
}

$stream_writer.close()
echo "-----read file -----"

sleep 3

# zde funkcni System.IO.StreamReader
#$path_input_file = "R:\file.txt"

#$stream_reader = [System.IO.StreamReader]::new($path_input_file)
$stream_reader = [System.IO.StreamReader]::new($path_input_otput_file)

while (-not $stream_reader.EndOfStream) {
$line_read = [int]($stream_reader.ReadLine())
echo $line_read
}

$stream_reader.close()


