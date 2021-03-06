function dotnet-test {
  Get-ChildItem -Path "test\**\*.csproj" | ForEach-Object {
    dotnet test $_ -c Release --no-build
  }
}

@( "dotnet-test" ) | ForEach-Object {
  echo ""
  echo "***** $_ *****"
  echo ""

  # Invoke function and exit on error
  &$_ 
  if ($LastExitCode -ne 0) { Exit $LastExitCode }
}