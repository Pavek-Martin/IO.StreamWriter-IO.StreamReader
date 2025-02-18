cls

#$path_input_file="klic_z_verze_12.txt"
$path_input_file="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.3_lite_a_max\Sifrovaci_program_GUI_PowerShell_verze_1.3_max\keys\max_1"
$stream_reader=[System.IO.StreamReader]::new($path_input_file)
$heslo_pro_zazipovani=""
$pole_reference_na_heslo=@()
$poc_all=1

$pole_ascii=@(48,57,97,122,65,90)
$d_pole_ascii=$pole_ascii.Length

$pole_znaky=@()
for ( $aa9 = 0; $aa9 -le $d_pole_ascii -2; $aa9++ ) {
$od5 = $pole_ascii[$aa9]
$do5 = $pole_ascii[$aa9+1]
for ( $bb9 = $od5; $bb9 -le $do5; $bb9++ ) {
$znk = [char] $bb9
$pole_znaky+=$znk
}
$aa9++
}

#echo $pole_znaky
$d_pole_znaky = $pole_znaky.Length-1 # pozor chybelo !

for ( $aa = 0; $aa -le 125; $aa++ ) { # 126 znaku hesla ( plati pro vsechny verze )

$poc_znaky = 1 # vzdy znovu definovat a nastavit na hodnotu 1 !!!
$rnd = Get-Random -Minimum 1 -Maximum 3844 # int 1-3844 ( 3844 znaku na jednom radku verze klice 1.3 max )
#$rnd = 3844  # test
#echo $rnd"<"

#while (-not $stream_reader.EndOfStream) { # puvodni satry
while ( $poc_znaky -le $rnd ) { # -le
    
#$jeden_znak = [int]($stream_reader.ReadLine())
$jeden_znak = ($stream_reader.ReadLine())
#echo $jeden_znak---




#echo "$poc_znaky - $jeden_znak"
$poc_znaky++
}

<# klic verze 1.3 max ( 3844 x 126 = 484344 )

0 1 2 3 4 5 . . . 3844
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
$poc_znaky-- # 3844 x 126 = 484344
$poc_all+=$poc_znaky

#echo $poc_znaky"--"
#echo $jeden_znak # "<<"
echo "$poc_znaky - $jeden_znak"
$heslo_pro_zazipovani+=$jeden_znak
$pole_reference_na_heslo+=$poc_znaky

# dopocita pocet znaku do konce jednoho radku
$do_konce_radku = 3844-$poc_znaky # 3844 znaku na jednom zadku v matici verze 1.3 max
#echo $do_konce_radku
#echo (( $poc_znaky + $do_konce_radku )) # toto cislo musi byt vzdy 3844 ( v1.3 max )
}# for $aa

$poc_all-- 
echo $poc_all"<-" # test $rnd = 3844 $poc_all = 484344 - posledni radek
#Write-Host -ForegroundColor Cyan $heslo_pro_zazipovani
#echo $heslo_pro_zazipovani
#echo $heslo_pro_zazipovani.Length

# uzavreni streamu az jako uplne posledni vec
$stream_reader.close()



# vypis pole reference na heslo, toto slouzi jenom pro kontrolu spravnosti
$reference_na_heslo_string=""
$d_pole_reference_na_heslo = $pole_reference_na_heslo.Length
for ( $bb=0; $bb -le $d_pole_reference_na_heslo-1; $bb++ ) {
echo $pole_reference_na_heslo[$bb]



# 4.11.2024 slozi z int 0-3843 znak 00-zz-zZ
$poc_10 = 0
for ( $aa9 = 0; $aa9 -le $d_pole_znaky; $aa9++) {
for ( $bb9 = 0; $bb9 -le $d_pole_znaky; $bb9++) {
$poc_10++
if ( $rnd -eq $poc_10 - 1 ) {
$x10 = $aa9
$x11 = $bb9
#echo $x10
#echo $x11

break # musi bejt break
}
}
}
$vysledek_ZZ=$pole_znaky[$x10]
$vysledek_ZZ+=$pole_znaky[$x11]
#echo $vysledek_ZZ
# konec 4.11.2024






$reference_na_heslo_string += [string] $pole_reference_na_heslo[$bb]
if ( $bb -ne $d_pole_reference_na_heslo-1 ) { $reference_na_heslo_string+="," }
}

#echo $reference_na_heslo_string
Write-Host -ForegroundColor Yellow $reference_na_heslo_string

Write-Host -ForegroundColor Cyan $heslo_pro_zazipovani


