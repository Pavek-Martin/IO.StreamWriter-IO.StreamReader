cls


$path_input_file = "C:\Users\DELL\Documents\ps1\IO.StreamWriter-IO.StreamReader\text.txt"

$stream_reader = [System.IO.StreamReader]::new($path_input_file)

while (-not $stream_reader.EndOfStream) {

$line_read = [int]($stream_reader.ReadLine())
echo $line_read
}


$stream_reader.close()
