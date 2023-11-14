$username = 'bnielson'
$dc = 'fuse.fabricorp.local'
$old = 'Fabricorp01'
$new = 'S0meVeryLongPa5s!'
$code = @'
[DllImport("netapi32.dll", CharSet = CharSet.Unicode)]
public static extern bool NetUserChangePassword(string domain, string username,
string oldpassword, string newpassword);
'@
$NetApi32 = Add-Type -MemberDefinition $code -Name 'NetApi32' -Namespace 'Win32'
-PassThru
$NetApi32::NetUserChangePassword($dc, $username, $old, $new)