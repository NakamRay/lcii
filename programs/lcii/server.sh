if test "$1" = "start"
then
  sudo service apache2 start
elif test "$1" = "stop"
then
  sudo service apache2 stop
else
  echo "invalid argument"
fi