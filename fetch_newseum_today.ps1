####
#
# This script downloads all front pages from newseum.org
# It will fetch only today's editions (both in jpg and pdf form)
# The newspapers need to be defined in $downloads, where the first element is the url and the second the output filename
# Each day a new folder will be created where the files will be saved
#
# I wrote this script solely for research purposes (my MA thesis), be aware of copyright issues
##

$dir = Get-Date -format "yyyy-MM-dd"
$dag = Get-Date -format "dd"
$url = "http://webmedia.newseum.org/newseum-multimedia/dfp/";
cd C:\Users\RichardvanSchaik\Dropbox\Exchange\Thesis\comdev\front_pages
mkdir $dir
cd $dir


$downloads = @(
@("$($url)pdf$($dag)/NET_DV.pdf", "NL_VK.pdf"), 
@("$($url)pdf$($dag)/GER_FAZ.pdf", "DE_FAZ.pdf"),
@("$($url)pdf$($dag)/GER_BILD.pdf", "DE_BILD.pdf"),
@("$($url)pdf$($dag)/NET_AD2.pdf", "NL_AD.pdf"),
@("$($url)pdf$($dag)/NET_TROUW.pdf", "NL_TROUW.pdf"),
@("$($url)pdf$($dag)/IRL_IT.pdf", "IRL_IRISHTIMES.pdf"),
@("$($url)pdf$($dag)/FRA_20M.pdf", "FR_20MINUTES.pdf"),
@("$($url)pdf$($dag)/AUT_DP.pdf", "AUT_DIELPRESSE.pdf"),
@("$($url)pdf$($dag)/UK_TG.pdf", "UK_GUARDIAN.pdf"),
@("$($url)pdf$($dag)/UK_TT.pdf", "UK_TIMES.pdf"),
@("$($url)pdf$($dag)/ITA_LS.pdf", "ITA_LASTAMPA.pdf"),
@("$($url)pdf$($dag)/BEL_DS.pdf", "BEL_DESTANDAARD.pdf"),
@("$($url)pdf$($dag)/SPA_PAIS.pdf", "SPA_ELPAIS.pdf"),
@("$($url)jpg$($dag)/lg/NET_DV.jpg", "NL_VK.jpg"), 
@("$($url)jpg$($dag)/lg/GER_FAZ.jpg", "DE_FAZ.jpg"),
@("$($url)jpg$($dag)/lg/GER_BILD.jpg", "DE_BILD.jpg"),
@("$($url)jpg$($dag)/lg/NET_AD2.jpg", "NL_AD.jpg"),
@("$($url)jpg$($dag)/lg/NET_TROUW.jpg", "NL_TROUW.jpg"),
@("$($url)jpg$($dag)/lg/IRL_IT.jpg", "IRL_IRISHTIMES.jpg"),
@("$($url)jpg$($dag)/lg/FRA_20M.jpg", "FR_20MINUTES.jpg"),
@("$($url)jpg$($dag)/lg/AUT_DP.jpg", "AUT_DIELPRESSE.jpg"),
@("$($url)jpg$($dag)/lg/UK_TG.jpg", "UK_GUARDIAN.jpg"),
@("$($url)jpg$($dag)/lg/UK_TT.jpg", "UK_TIMES.jpg"),
@("$($url)jpg$($dag)/lg/ITA_LS.jpg", "ITA_LASTAMPA.jpg"),
@("$($url)jpg$($dag)/lg/BEL_DS.jpg", "BEL_DESTANDAARD.jpg"),
@("$($url)jpg$($dag)/lg/SPA_PAIS.jpg", "SPA_ELPAIS.jpg")
)
foreach ($x in $downloads) {
	wget $x[0] -OutFile $x[1];
}
cd ..