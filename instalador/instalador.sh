inicio()
{
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install nautilus
}
gitInstall()
{
	echo "instalaremos git"
	#instalaremos git
	sudo apt-get install git
	git config --global user.name "Irvin DANIEL"
	git config --global user.email "irvind.moreno@gmail.com"
	git config --global color.ui true
	git config --global --list
}
ohMyZsh()
{
	echo "Cambiaremos la terminal por una mas bonita"
	#cambiaremos la terminarl a una mas bonita
	sudo apt-get install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}
sublime3()
{
	echo "Instalaremos sublime-text-3"
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get install sublime-text-installer
}
meld()
{
	echo "instalaremos meld"
	sudo apt-get install meld
}
lamp()
{
	echo "instalaremos apache2"
		sudo apt-get install apache2
	echo "instalaremosmysql"
		sudo apt-get install mysql-server php5-mysql
		sudo mysql_install_db
		sudo mysql_secure_installation
	echo "instalaremos php"
		sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt				
		sudo subl /etc/apache2/mods-enabled/dir.conf
		echo "!IMPORTANTE:Debemos remplazar la siguiente linea:
			DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
			por:
			DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm"
		sleep 3m
		sudo service apache2 restart
		sudo subl /var/www/html/info.php
		echo "!IMPORTANTE: Dentro pegar:
		dentro pegar:
		<?php
			phpinfo();
		?>
		luego guarda con ctr+o, enter, ctr x"
		sleep 3m
	echo "instalaremos phpmyadmin"
		sudo apt-get install phpmyadmin -y
		sudo ln -s /usr/share/phpmyadmin/ /var/www/html/
}
composer()
{
	sudo apt-get install curl
	sudo apt-get install php5-cli
	sudo curl -sS https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer
}
virtualBox()
{
	echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    sudo apt-get update
    sudo apt-get install virtualbox-5.0
}
configurarMiMaquina()
{
	cd $HOME	
	rutazkte="$(pwd)"
cadena='
#INICIO Del Zkte-guia
	alias gs="git status"
	alias gb="git branch"
	alias ga="git add -A"
	alias gc="git commit -m"
	alias gck="git checkout"
	alias gpl="git pull origin"
	alias gps="git push origin"
	alias gm="git merge"
	alias gf="git fetch"
	alias subl.zkte.guia="subl '$rutazkte'/Carrera/Zkte-Guia/"
	alias subl.zsrh="subl '$rutazkte'/.zshrc"
	alias rut.zkte.guia="cd '$rutazkte'/Carrera/Zkte-Guia/"
	alias op.carrera="nautilus '$rutazkte'/Carrera"
	alias op.front="nautilus '$rutazkte'/Proyectos"
#FIN Del Zkte-guia'
echo "$cadena" >> ~/.zshrc

	
	cd Carrera
	mkdir FrontEnd
	cd FrontEnd
	eval "$(ssh-agent -s)"
	ssh-add
	git clone git@github.com:irvindmoreno/zkte-front.git
	cd zkte-front
	git fetch origin jquery:jquery
	git checkout jquery	
	./install.sh

}
crearLLavesParaGir()
{
	ssh-keygen
	cd ~/
	ls -la
	cd .ssh
	ls
	sudo cat id_rsa.pub
	echo "deberias subir tus llaves a github y bitbucket"
	sleep 3m
}
wine()
{
	sudo apt-get install wine
}
zkteguia()
{
	cd $HOME
	mkdir Carrera	
	cd Carrera
	eval "$(ssh-agent -s)"
	ssh-add
	git clone git@github.com:irvindmoreno/Zkte-Guia.git
	#cd Zkte-Guia
	#chmod 775 -R instalador
	#cd instalador
	#./instalador.sh	
}
nodejsnpm()
{
	curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
	sudo apt-get install -y nodejs
}
gulp()
{
	sudo npm install --save gulp-install
	sudo npm install -g gulp
	sudo apt-get install gtk2-engines-pixbuf gnome-themes-standard libcanberra-gtk3-module:i386 libcanberra-gtk3-module
}
inicio
gitInstall
crearLLavesParaGir
zkteguia
ohMyZsh
sublime3
meld
lamp
virtualBox
configurarMiMaquina
wine
nodejsnpm
gulp
#composer
