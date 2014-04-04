dism { 'IIS-WebServerRole' :
  ensure => present,
}

dism { 'IIS-WebServer' :
  ensure  => present,
  require => Dism['IIS-WebServerRole'],
}

dism { 'IIS-ISAPIFilter' :
  ensure  => present,
  before => Dism['IIS-ASPNET'],
}

dism { 'IIS-ISAPIExtensions' :
  ensure  => present,
  before => Dism['IIS-ASPNET'],
}

dism { 'IIS-NetFxExtensibility' :
  ensure  => present,
  before => Dism['IIS-ASPNET'],
  require => Dism['IIS-WebServer']
}

dism { 'IIS-ASPNET' :
  ensure  => present,
  require => Dism['IIS-WebServer'],
}



file {'c:/inetpub/wwwroot/iisstart.htm':
  ensure          => absent,
  require         => Dism['IIS-WebServer']
}

file {'c:/inetpub/wwwroot/default.aspx':
  ensure          => present,
  content         =>
'<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
<title>Managed by Puppet</title>
</head>
<body>
<h1>Managed by Puppet</h1>

<strong>Time:</strong> <%= DateTime.UtcNow.ToString("s") + "Z" %>
</body>
</html>',
  require         => Dism['IIS-WebServer']
}


package { "Jenkins 1.556" :
    ensure => installed,
    source => 'c:\\vagrant\\jenkins-1.556.msi'
}

service { 'jenkins' :
  ensure  => running,
  enable => true
}
