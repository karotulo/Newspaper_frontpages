####
#
# This script downloads all front pages from newseum.org
# It will fetch all archived editions from the dates specified in the $todo variable
# The newspapers need to be defined in $downloads, where the first element is the url and the second the output filename
#
# I wrote this script solely for research purposes (my MA thesis), be aware of copyright issues
##

$todo  = @("2015-10-02");

foreach($dir in $todo) {
//$dir = "2015-10-02"
$dag = $dir
$url = "http://webmedia.newseum.org/newseum-multimedia/tfp_archive/";
cd C:\Users\RichardvanSchaik\Dropbox\Exchange\Thesis\comdev\front_pages
mkdir $dir
cd $dir


$downloads = @(
@("$($url)$($dag)/pdf/NET_DV.pdf", "NL_VK.pdf"), 
@("$($url)$($dag)/pdf/GER_FAZ.pdf", "DE_FAZ.pdf"),
@("$($url)$($dag)/pdf/GER_BILD.pdf", "DE_BILD.pdf"),
@("$($url)$($dag)/pdf/NET_AD2.pdf", "NL_AD.pdf"),
@("$($url)$($dag)/pdf/NET_TROUW.pdf", "NL_TROUW.pdf"),
@("$($url)$($dag)/pdf/IRL_IT.pdf", "IRL_IRISHTIMES.pdf"),
@("$($url)$($dag)/pdf/FRA_20M.pdf", "FR_20MINUTES.pdf"),
@("$($url)$($dag)/pdf/AUT_DP.pdf", "AUT_DIELPRESSE.pdf"),
@("$($url)$($dag)/pdf/UK_TG.pdf", "UK_GUARDIAN.pdf"),
@("$($url)$($dag)/pdf/UK_TT.pdf", "UK_TIMES.pdf"),
@("$($url)$($dag)/pdf/ITA_LS.pdf", "ITA_LASTAMPA.pdf"),
@("$($url)$($dag)/pdf/BEL_DS.pdf", "BEL_DESTANDAARD.pdf"),
@("$($url)$($dag)/pdf/SPA_PAIS.pdf", "SPA_ELPAIS.pdf"),
@("$($url)$($dag)/lg/NET_DV.jpg", "NL_VK.jpg"), 
@("$($url)$($dag)/lg/GER_FAZ.jpg", "DE_FAZ.jpg"),
@("$($url)$($dag)/lg/GER_BILD.jpg", "DE_BILD.jpg"),
@("$($url)$($dag)/lg/NET_AD2.jpg", "NL_AD.jpg"),
@("$($url)$($dag)/lg/NET_TROUW.jpg", "NL_TROUW.jpg"),
@("$($url)$($dag)/lg/IRL_IT.jpg", "IRL_IRISHTIMES.jpg"),
@("$($url)$($dag)/lg/FRA_20M.jpg", "FR_20MINUTES.jpg"),
@("$($url)$($dag)/lg/AUT_DP.jpg", "AUT_DIELPRESSE.jpg"),
@("$($url)$($dag)/lg/UK_TG.jpg", "UK_GUARDIAN.jpg"),
@("$($url)$($dag)/lg/UK_TT.jpg", "UK_TIMES.jpg"),
@("$($url)$($dag)/lg/ITA_LS.jpg", "ITA_LASTAMPA.jpg"),
@("$($url)$($dag)/lg/BEL_DS.jpg", "BEL_DESTANDAARD.jpg"),
@("$($url)$($dag)/lg/SPA_PAIS.jpg", "SPA_ELPAIS.jpg")
)
foreach ($x in $downloads) {
	wget $x[0] -OutFile $x[1];
}
cd ..
}