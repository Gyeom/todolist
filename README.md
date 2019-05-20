
# TODO List

## Environment

    * Java 1.8
    * Spring Framework 5.0.4.RELEASE
    * MySQL 5.7
    * AWS EC2 & RDS
    
### Installation
> ↓ Ubuntu 사용법 ↓

#### Installing Java

 # JRE, JDK 설치
  * sudo apt-get install openjdk-8-jre
  * sudo apt-get install openjdk-8-jdk

 # Java 설치 확인을 위한 버전체크 
  * javac -version
  * java -version

 # 설치된 자바 목록 
  * sudo update-alternatives --config java

#### Installing Tomcat

 # 톰캣8 설치
  * sudo apt-get install tomcat8

 # 톰캣 버전 
  * sudo /usr/share/tomcat8/bin/version.sh

 # 방화벽에서 톰캣 포트 외부접속 
  * sudo ufw allow (톰캣 포트번호)/tcp

 # 톰캣 
  * sudo service tomcat8 start
  
 # URL
  * http://우분투서버IP주소:톰캣포트번호
 
#### Installing MySQL

# MySQL 버전을 확인
  * sudo apt-cache search mysql-server

# MySQL 5.7 설치
  * sudo apt-get install mysql-server-5.7

# MySQL 5.7 설치확인
  * /etc/init.d/mysql status

# MySQL root 계정 접속, 데이터베이스 조회
  * mysql -uroot -p -e'show databases'


## Requirements

# 기능 요구사항
○ 새로운 TODO(제목과 내용)를 작성할 수 있다.
○ TODO 목록을 볼 수 있다.
○ TODO 항목의 제목과 내용을 수정할 수 있다.
○ TODO 항목을 삭제할 수 있다.
○ 사용자의 선택에 의해 TODO에는 마감 기한을 넣을 수 있다.
○ TODO 항목의 우선순위를 설정 및 조절할 수 있다.
○ TODO 항목에 대한 완료 처리를 할 수 있다.
○ 마감기한이 지난 TODO에 대해 알림을 노출할 수 있다.

# 성능 요구사항
○ TODO 이용 시 발생하는 오류 사항을 최소화한다.
○ 오류 발생 시 사용자가 이해하기 쉽게 표시한다.
○ 다른 사람이 읽기 쉬운 코드를 작성한다.
○ HTML/CSS에서 사용할 수 있는 최신 구조와 기술을 사용한다.

# 인터페이스 요구사항
○ 직관적이고 의미 전달이 명확한 화면을 사용자에게 제공한다

