alias telcheck='/home/morteza/bin/telnet'
alias search='locate -d /var/lib/mlocate/mlocate.db -d /media/Other/.database_file -A -i'
alias searchOther='locate -d /media/Other/.database_file -A -i'
searchUpdate(){
    sudo updatedb; 
    updatedb -l 0 -U /media/Other/ -o /media/Other/.database_file; 
}

share_ap(){
    echo "*******  SSID: msa832  ---  PASS: 0830024832  *******";
    sudo create_ap wlp3s0 wlp3s0 msa832 0830024832;
}

pdfdoc(){
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    WHITE='\033[1;33m'
    NC='\033[0m' # No Color

    if [ -z "$1" ]; then
        printf "${GREEN}Command: ${WHITE}pdfdoc code date pdfFile\n${NC}"
        read -p "code?  " code
    else
        code=$1
    fi

    if [ -z "$2" ]; then
        read -p "date?  " jdate
    else
        jdate=$2
    fi

    if [ -z "$3" ]; then
        read -p "file?  " infile
    else
        infile=$3
    fi

    printf "${GREEN}code: ${BLUE}$code -- ${GREEN}date: ${BLUE}$jdate -- ${GREEN}pdf: ${BLUE}$infile\n${NC}"
    printf "${GREEN}Command: ${WHITE}pdfdoc $code $jdate $infile\n${NC}"

    folder=/home/morteza/Desktop/Madarek/Files/$code;

    if [ ! -d "$folder" ]; then
        mkdir $folder
    fi
    gs -sDEVICE=jpeg -o $folder/${code}-${jdate}04000%d.jpg -r140 $infile
    #pdfimages -all $infile $code-$jdate04

    mogrify -brightness-contrast 15x10 $folder/*.jpg
}
