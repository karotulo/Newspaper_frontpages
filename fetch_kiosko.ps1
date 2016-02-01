####
#
# This script downloads all front pages from kiosko.net
# It will fetch all editions between $startdate and $enddate
# The newspapers need to be defined in $kranten, where the first element is the url of the newspaper, the second is the file output prefix
#
# I wrote this script solely for research purposes (my MA thesis), be aware of copyright issues
##
$kranten = @(
@('/de/bild.jpg', 'bild'),
@('/de/faz.jpg', 'faz')
)



foreach ($krant in $kranten) {
	$startdate = Get-Date -Date '2015-06-01'
	$enddate = Get-Date -Date '2015-10-31'

	$difference = New-TimeSpan -Start $startdate -End $enddate
	$days = [Math]::Ceiling($difference.TotalDays)+1

	1..$days | ForEach-Object {  
	$dateStr = $startdate.ToString("yyyy/MM/dd")
	$dateStr2 = $startdate.ToString("yyyyMMdd")
	
	$kpath = $krant[0];
	$kfile = $krant[1];

	$url = "http://img.kiosko.net/$($dateStr)$($kpath)"
	wget $url -OutFile "$($kfile)-$($dateStr2).png"
	Write-Host $url 
	$startdate = $startdate.AddDays(1)
	}
}