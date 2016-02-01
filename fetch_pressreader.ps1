####
#
# This script downloads all front pages from pressreader.com
# It will fetch all editions between $startdate and $enddate
# The newspapers need to be defined in $kranten, where the first element is the newspaper id, the second the highest resolution and the last the file prefix 
#
# I wrote this script solely for research purposes (my MA thesis), be aware of copyright issues
##
$kranten = @(
@('3214', '100', 'destandaard'),
@('3013', '98', 'diepresse'),
@('1545', '91', 'theguardian'),
@('3207', '100', 'telegraaf')
)

foreach ($krant in $kranten) {
	$startdate = Get-Date -Date '2015-09-17'
	$enddate = Get-Date -Date '2015-09-17'

	$difference = New-TimeSpan -Start $startdate -End $enddate
	$days = [Math]::Ceiling($difference.TotalDays)+1

	1..$days | ForEach-Object {  
	$dateStr = $startdate.ToString("yyyyMMdd")
	
	$knum = $krant[0];
	$ksize = $krant[1];
	$kfile = $krant[2];

	$url = "http://cache3-img1.pressdisplay.com/pressdisplay/docserver/getimage.aspx?file=$($knum)$($dateStr)00000000001001&page=1&scale=$($ksize)"
	wget $url -OutFile "$($kfile)-$($dateStr).png"
	Write-Host $url 
	$startdate = $startdate.AddDays(1)
	}
}