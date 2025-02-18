cls

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


$reference_klice="GKBt8VSw2I39LecXNJ1EirxDRaZjhQC5s9itdHRlMhIRBMW3EPwhfo2ocs5LtkVJ2yA3ZTNmsTUE0bF8jldUQRUgKJmisf8u9Z4T1ySlNPSzD8DakepQfWnnGPK77FHyrESPV888MuqWNyhubkgOl4sHJRYbAb8RRejHBfOanqbUbXtieyIiXVIaNJX4eACKDzAwZVFRf036WANI1sdBG60FzR7m3QSNeZZzUiHRgLLRmtvkWp1jSsEUZVtG"
$reference_klice_2 = ""
$poc_heslo = 0


for ( $kk = 0 ; $kk -le $d_nalezene_heslo - 2; $kk = $kk + 2 ){
echo $kk
$dvojice_heslo = $nalezene_heslo.Substring($kk,2)
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
break # musi bejt
}
}
}
# konec 4.11.2024
echo $kk
$reference_klice_2 += [string] $vysledek_int
if ( $kk -ne 250 ) { $reference_klice += ","}

$heslo_pro_rozpakovani += $matrix[$poc_heslo][$vysledek_int]
$poc_heslo++
}


Write-host -ForegroundColor yellow $reference_klice 
Write-host -ForegroundColor red $nalezene_heslo
Write-host -ForegroundColor cyan $heslo_pro_rozpakovani
sleep 5
# zde samotny rozpakovani archivu

