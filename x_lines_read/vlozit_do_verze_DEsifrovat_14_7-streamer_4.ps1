#cls

#$path_input_file="klic_z_verze_12.txt"
$path_input_file="C:\Users\DELL\Documents\ps1\_GUI\Sifrovaci_program_GUI\Sifrovaci_program_GUI_PowerShell_verze_1.3_lite_a_max\"
$path_input_file+= "Sifrovaci_program_GUI_PowerShell_verze_1.3_max\keys\"
#$path_input_file += "max_1"
#$path_input_file += "max_2"
$path_input_file += "max_3"

$stream_reader=[System.IO.StreamReader]::new($path_input_file)


# pole znaky
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


#$reference_klice="GKBt8VSw2I39LecXNJ1EirxDRaZjhQC5s9itdHRlMhIRBMW3EPwhfo2ocs5LtkVJ2yA3ZTNmsTUE0bF8jldUQRUgKJmisf8u9Z4T1ySlNPSzD8DakepQfWnnGPK77FHyrESPV888MuqWNyhubkgOl4sHJRYbAb8RRejHBfOanqbUbXtieyIiXVIaNJX4eACKDzAwZVFRf036WANI1sdBG60FzR7m3QSNeZZzUiHRgLLRmtvkWp1jSsEUZVtG"
$reference_klice_2 = ""
$poc_heslo = 0
$heslo_pro_rozzipovani=""


for ( $kk = 0 ; $kk -le 252 - 2; $kk = $kk + 2 ){
#echo $kk
$dvojice_heslo = $reference_klice.Substring($kk,2)
#echo $dvojice_heslo # string


# 4.11.2024 prevede dvojici 00-zz-ZZ spatky do int
$dvojice_heslo_a = $dvojice_heslo.Substring(0,1)
$dvojice_heslo_b = $dvojice_heslo.Substring(1,1)
$poc_20 = 0
for ( $aa20 = 0; $aa20 -le $d_pole_znaky; $aa20++) {
for ( $bb20 = 0; $bb20 -le $d_pole_znaky; $bb20++) {
$poc_20++
if (( $dvojice_heslo_a -ceq $pole_znaky[$aa20] ) -and ( $dvojice_heslo_b -ceq $pole_znaky[$bb20])) {# - ceq case sensitive operator 
$vysledek_int=$poc_20
$vysledek_int--
#echo $vysledek_int
break # musi bejt
#echo $vysledek_int
}
}
}
# konec 4.11.2024
#echo $kk
#echo $vysledek_int"<"
$reference_klice_2 += [string] $vysledek_int
if ( $kk -ne 250 ) { $reference_klice_2 += ","}

#$heslo_pro_rozpakovani += $matrix[$poc_heslo][$vysledek_int]
$poc_heslo++




###############################################################
# zde prevede zjistene int na znak hesla ze steamu klice
###############################################################
#while (-not $stream_reader.EndOfStream) { # puvodni stary
#echo $vysledek_int"<"
$poc_znaky = 0 # vzdy znovu definovat a nastavit na hodnotu 0 !!!
while ( $poc_znaky -le $vysledek_int ) { # -le
#$jeden_znak = [int]($stream_reader.ReadLine())
$jeden_znak = ($stream_reader.ReadLine())
#echo $jeden_znak---
#echo "$poc_znaky - $jeden_znak"
$poc_znaky++
}

#$poc_znaky-- # 3844 x 126 = 484344
#$poc_all+=$poc_znaky

#echo $poc_znaky"--"
#echo $jeden_znak # "<<"
#echo "$poc_znaky - $jeden_znak"
$heslo_pro_rozzipovani += $jeden_znak
#$pole_reference_na_heslo+=$poc_znaky

<#
# dopocita pocet znaku do konce jednoho radku
$do_konce_radku = 3843 - $poc_znaky # 3844 znaku na jednom zadku v matici verze 1.3 max
for ( $aa15 = 1; $aa15 -le $do_konce_radku; $aa15++) {
$preskoc_radek = ($stream_reader.ReadLine())
}
#>

#echo $do_konce_radku
#echo (( $poc_znaky + $do_konce_radku )) # toto cislo musi byt vzdy 3844 ( v1.3 max )



}


Write-host -ForegroundColor yellow $reference_klice_2
Write-host -ForegroundColor red $reference_klice
Write-host -ForegroundColor cyan $heslo_pro_rozzipovani
#sleep 5
# zde samotny rozpakovani archivu
echo "zde 2"

