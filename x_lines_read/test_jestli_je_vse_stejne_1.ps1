# test stejnosti ZA a DE


echo $heslo_pro_zazipovani
echo $heslo_pro_rozzipovani

if ( $heslo_pro_zazipovani -ceq $heslo_pro_rozzipovani ){
echo "ok"
}else{
echo "NEsouhlasi"
}


# 
echo $reference_na_heslo_base
echo $reference_klice

if ( $reference_na_heslo_base -ceq $reference_klice ){
echo "ok"
}else{
echo "Nesouhlasi"
}
echo "zde konec test"





