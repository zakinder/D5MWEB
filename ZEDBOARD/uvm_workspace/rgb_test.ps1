$ie = new-object -comobject InternetExplorer.Application
$ie.visible = $true

$ie.addressbar=$false

$ie.menubar=$false
$ie.toolbar=$false
$ie.top = 200; $ie.Left = 100
$ie.navigate("file:///R:/coverage_reports/questa_html_coverage_reports/rgb_test/pages/__frametop.htm")

