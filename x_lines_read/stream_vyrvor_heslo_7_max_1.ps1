cls

#$path_input_file="klic_z_verze_12.txt"
$path_input_file="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.3_lite_a_max\Sifrovaci_program_GUI_PowerShell_verze_1.3_max\keys\max_1"
$stream_reader=[System.IO.StreamReader]::new($path_input_file)
$heslo_pro_zazipovani=""
$pole_reference_na_heslo=@()
$poc_all=1

for ( $aa = 0; $aa -le 125; $aa++ ) { # 126 znaku hesla ( plati pro vsechny verze )

$poc_znaky = 1 # vzdy znovu definovat a nastavit na hodnotu 1 !!!
$rnd = Get-Random -Minimum 1 -Maximum 3843 # int 1-3843 ( 3843 znaku na jednom radku verze klice 1.3 max )
#$rnd = 256  # test
#echo $rnd"<"

#while (-not $stream_reader.EndOfStream) { # puvodni satry
while ( $poc_znaky -le $rnd ) { # -le
    
#$jeden_znak = [int]($stream_reader.ReadLine())
$jeden_znak = ($stream_reader.ReadLine())
#echo "$poc_znaky - $jeden_znak"
$poc_znaky++
}

<# klic verze 1.3 max ( 3843 x 126 = 484218 )

0 1 2 3 4 5 . . . 3843
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
$poc_znaky-- # 3843 x 126 = 484218
$poc_all+=$poc_znaky

#echo $poc_znaky"--"
#echo $jeden_znak # "<<"
echo "$poc_znaky - $jeden_znak"
$heslo_pro_zazipovani+=$jeden_znak
$pole_reference_na_heslo+=$poc_znaky

# dopocita pocet znaku do konce jednoho radku
$do_konce_radku = 3843-$poc_znaky # 3843 znaku na jednom zadku v matici verze 1.3 max
#echo $do_konce_radku
#echo (( $poc_znaky + $do_konce_radku )) # toto cislo musi byt vzdy 3843 ( v1.3 max )
}# for $aa

$poc_all-- 
echo $poc_all"<-" # test $rnd = 3843 $poc_all = 484218 - posledni radek
#Write-Host -ForegroundColor Cyan $heslo_pro_zazipovani
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

Write-Host -ForegroundColor Cyan $heslo_pro_zazipovani


