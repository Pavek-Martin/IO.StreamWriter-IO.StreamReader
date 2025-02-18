cls

$path_input_file = "text.txt"
$path_output_file = "text_out.txt"

$stream_reader = [System.IO.StreamReader]::new($path_input_file)
$stream_writer = [System.IO.StreamWriter]::new($path_output_file)

while (-not $stream_reader.EndOfStream) {
$read_line = [string]($stream_reader.ReadLine())
#echo $read_line
$out_line = $read_line # kdyz to tu nebylo tak to delalo dlouhej prezdnej soubor !?
[string]$stream_writer.WriteLine("$out_line")
#echo "write line"
}

sleep 2
echo "hotovo"
$stream_reader.close()
$stream_writer.close()
sleep 2

# na text_out.txt dat dos2unix text_out.txt a pak  diff text.txt text_out.txt a pak jsou oba stejne
# tzn. [System.IO.StreamWriter] dela unixovy zakonceni radku v souboru v powershellu viz. obr_2.jpg


