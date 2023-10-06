
export JAVA_TOOL_OPTIONS="-Djava.net.useSystemProxies=true"
echo $JAVA_TOOL_OPTIONS

if [ -d "${HOME}/Maven/bin" ]
then
	echo 'Maven is already installed.'
	export PATH=$HOME/Maven/bin:${PATH}
	mvn --version

else
	if [ -d "${HOME}/Maven" ]; then
		rm -r '${HOME}/Maven' 
	fi	
	if [ -d "${HOME}/maven" ]; then
		rm -r  '${HOME}/maven'
	fi

	echo "Downloading Maven..."
	wget 'https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz'
	tar -xf 'apache-maven-3.9.5-bin.tar.gz'
	echo 'moving files...'
	rm -r 'apache-maven-3.9.5-bin.tar.gz'
	mv apache-maven-3.9.5 $HOME/Maven
	export PATH=$HOME/Maven/bin:${PATH}
	echo 'Maven has been sucessfully installed'
	mvn --version
fi


if [ -d "${HOME}/.m2" ]
then 
	echo 'checking settings...'
	if [ ! -f "${HOME}/.m2/settings.xml" ]; then
		echo $'<settings>\n<proxies>\n<proxy>\n<id>default</id>\n<active>true</active>\n<protocol>https</protocol>\n<host>proxy.spo.ifsp.edu.br</host>\n<port>3128</port>\n</proxy>\n</proxies>\n</settings>' > $HOME/.m2/settings.xml
		echo "file setting created."

	fi
	echo 'Everything all right. We ready to go.'
fi
