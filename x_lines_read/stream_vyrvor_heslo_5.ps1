cls

$path_input_file="klic_z_verze_12.txt"
$stream_reader=[System.IO.StreamReader]::new($path_input_file)
$heslo_pro_zazipovani=""
$pole_reference_na_heslo=@()
$poc_all=1

for ( $aa = 0; $aa -le 125; $aa++ ) { # 126 znaku hesla ( plati pro vsechny verze )

$poc_znaky = 1 # vzdy znovu definovat a nastavit na hodnotu 1 !!!
$rnd = Get-Random -Minimum 1 -Maximum 256 # int 1-256 ( 256 znaku na jednom radku verze klice 1.2 )
#$rnd = 256  # test
#echo $rnd"<"

#while (-not $stream_reader.EndOfStream) { # puvodni satry
while ( $poc_znaky -le $rnd ) { # -le
    
#$jeden_znak = [int]($stream_reader.ReadLine())
$jeden_znak = ($stream_reader.ReadLine())
#echo "$poc_znaky - $jeden_znak"
$poc_znaky++
}

<# klic verze 1.2 ( 256 x 126 = 32256 )

0 1 2 3 4 5 . . . 255
1
2
3
4
5
.
.
.
125

#>
$poc_znaky-- # 256 x 126 = 32256
$poc_all+=$poc_znaky

#echo $poc_znaky"--"
#echo $jeden_znak # "<<"
echo "$poc_znaky - $jeden_znak"
$heslo_pro_zazipovani+=$jeden_znak
$pole_reference_na_heslo+=$poc_znaky

# dopocita pocet znaku do konce jednoho radku
$do_konce_radku = 256-$poc_znaky # 256 znaku na jednom zadku v matici verze 1.2
#echo $do_konce_radku
#echo (( $poc_znaky + $do_konce_radku )) # toto cislo musi byt vzdy 256 (v1.2)
}# for $aa

$poc_all-- 
echo $poc_all"<-" # test $rnd = 256 $poc_all = 32256 - posledni radek
Write-Host -ForegroundColor Cyan $heslo_pro_zazipovani
#echo $heslo_pro_zazipovani
#echo $heslo_pro_zazipovani.Length

# uzavreni streamu az jako uplne posledni vec
$stream_reader.close()




# vypis pole reference na heslo, toto slouzi jenom pro kontrolu spravnosti
$reference_na_heslo_string=""
$d_pole_reference_na_heslo = $pole_reference_na_heslo.Length
for ( $bb=0; $bb -le $d_pole_reference_na_heslo-1; $bb++ ) {
#echo $pole_reference_na_heslo[$bb]
$reference_na_heslo_string += [string] $pole_reference_na_heslo[$bb]
if ( $bb -ne $d_pole_reference_na_heslo-1 ) { $reference_na_heslo_string+="," }
}

#echo $reference_na_heslo_string
Write-Host -ForegroundColor Yellow $reference_na_heslo_string
