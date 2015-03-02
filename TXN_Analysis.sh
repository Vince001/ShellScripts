#!/bin/sh

# Vince 2014-10-16 Created.
# 1, Only for Loyalty debit transaction analysis.
# 2, The 256 bytes file header will not display.
# 3, Add the header analysis.

# todo printf char as "M" "B" "L"
# todo recognise the LSAM PSAM Card Type

# Note: If you run the script on a new Ubuntu, please run: sudo dpkg-reconfigure dash

echo "===============================================================>>"

txnfile=$1

if [ ! -f $txnfile ]; then
    echo "Not txn file!"
    exit 0
fi

num=$(cat $txnfile | wc -c)
let txn_cnt=($num-256)/64
echo "File size: $num ====> Txn counter: $txn_cnt"
echo ""

n=0
txn_index=1

#decalare -a sam_type_s
sam_type_s[2]="LSamCan"
sam_type_s[1]="PSamCan"
sam_type_s[2]="LSamCan"

SamCan[8]=0;
CardCan[8]=0;
SamCTC[3]=0;
UsrCTC[2]=0;
TxnTime[7]=0;
BalanceBefore[4]=0;
Amount[4]=0;
Tcert[4]=0;
Dcert[4]=0;
StationON[3]=0;
StationOFF[3]=0;
TapInTime[6]=0;
RFU[3]=0;

# -- Head contents
HeaderMAC[4]=0;
HeaderSHA1[20]=0;
HeaderSoftwareVer[2]=0;
HeaderAppCode[6]=0;
HeaderSamCan[8]=0;
HeaderBlacklistVer[4]=0;
HeaderRFU1=0;
HeaderAppType=0;
HeaderFileStatus=0;  # 0xAA effective 0xBB invalid
HeaderSequenceNO[2]=0;
HeaderTxnCnt[2]=0;
HeaderDateTime[7]=0;
HeaderCollectFlag=0;     # 0x00 not collected 0x01 collected
HeaderMachineCode=0;    # char "M" for Machine
HeaderMachineNum[3]=0;
HeaderBusCode=0;  #  "B" BV
HeaderBusNum[3]=0;
HeaderBusLineCode=0;  # "L"  Bus Line, Bus APP
HeaderBusLineNum[3]=0;
HeaderDriverCode[4]=0;
HeaderRunCode[4]=0;
HeaderRFU44[44]=0;
HeaderFileType[4]=0;  # "R""E""C""."

# Analysis the transaction file header.
while [[ $n -lt 255 ]]   # 0-255
do    
    printf "***************************************************************************\n"
    HeaderMAC[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderMAC[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderMAC[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderMAC[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
    HeaderSHA1[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[5]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[6]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[7]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[8]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[9]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[10]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[11]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[12]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[13]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[14]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[15]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[16]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[17]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[18]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[19]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSHA1[20]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
            
    HeaderSoftwareVer[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSoftwareVer[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
    HeaderAppCode[1]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))
    HeaderAppCode[2]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))
    HeaderAppCode[3]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))
    HeaderAppCode[4]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))
    HeaderAppCode[5]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))
    HeaderAppCode[6]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))
        
    HeaderSamCan[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[5]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[6]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[7]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSamCan[8]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
    HeaderBlacklistVer[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBlacklistVer[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBlacklistVer[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBlacklistVer[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=2))
    
    #HeaderRFU1;
    HeaderAppType=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderFileStatus=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))  # 0xAA effective 0xBB invalid
        
    HeaderSequenceNO[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderSequenceNO[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
    HeaderTxnCnt[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderTxnCnt[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
    HeaderDateTime[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDateTime[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDateTime[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDateTime[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDateTime[5]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDateTime[6]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDateTime[7]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    
    HeaderCollectFlag=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))     # 0x00 not collected 0x01 collected
    HeaderMachineCode=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))    # char "M" for Machine
        
    HeaderMachineNum[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderMachineNum[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderMachineNum[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    
    HeaderBusCode=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))  #  "B" BV
    
    HeaderBusNum[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBusNum[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBusNum[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    
    HeaderBusLineCode=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))  # "L"  Bus Line, Bus APP
        
    HeaderBusLineNum[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBusLineNum[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderBusLineNum[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
    HeaderDriverCode[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDriverCode[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDriverCode[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderDriverCode[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    
    HeaderRunCode[1]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderRunCode[2]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderRunCode[3]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    HeaderRunCode[4]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=45))
    
    # HeaderRFU44[44]=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
    
    let n=$n+1  # the doc miss a byte definition
    
    HeaderFileType[1]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))  # "R""E""C""."
    HeaderFileType[2]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))  # "R""E""C""."
    HeaderFileType[3]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))  # "R""E""C""."
    HeaderFileType[4]=$(od -An -j $n -N 1 -t c $txnfile) && ((n+=1))  # "R""E""C""."
    
    printf "MAC: %02X%02X%02X%02X \n" ${HeaderMAC[1]} ${HeaderMAC[2]} ${HeaderMAC[3]} ${HeaderMAC[4]}
    printf "SHA1: %02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X \n" \
                  ${HeaderSHA1[1]}${HeaderSHA1[2]} ${HeaderSHA1[3]} ${HeaderSHA1[4]} ${HeaderSHA1[5]} ${HeaderSHA1[6]} ${HeaderSHA1[7]} ${HeaderSHA1[8]} ${HeaderSHA1[9]} ${HeaderSHA1[10]} \
                  ${HeaderSHA1[11]} ${HeaderSHA1[12]} ${HeaderSHA1[13]} ${HeaderSHA1[14]} ${HeaderSHA1[15]} ${HeaderSHA1[16]} ${HeaderSHA1[17]} ${HeaderSHA1[18]} ${HeaderSHA1[19]} ${HeaderSHA1[20]}
    printf "SoftwareVer: %02X %02X \n" ${HeaderSoftwareVer[1]} ${HeaderSoftwareVer[2]}
    printf "AppCode: %c%c%c%c%c%c \n" ${HeaderAppCode[1]} ${HeaderAppCode[2]} ${HeaderAppCode[3]} ${HeaderAppCode[4]} ${HeaderAppCode[5]} ${HeaderAppCode[6]}
    printf "SamCan: %02X%02X%02X%02X%02X%02X%02X%02X \n" \
                    ${HeaderSamCan[1]} ${HeaderSamCan[2]} ${HeaderSamCan[3]} ${HeaderSamCan[4]} ${HeaderSamCan[5]} ${HeaderSamCan[6]} ${HeaderSamCan[7]} ${HeaderSamCan[8]}
    printf "BlacklistVer: %02X %02X %02X %02X \n" ${HeaderBlacklistVer[1]} ${HeaderBlacklistVer[2]} ${HeaderBlacklistVer[3]} ${HeaderBlacklistVer[4]}
    # printf "RFU1;"
    printf "AppType: %02X \n" $HeaderAppType
    printf "FileStatus: %02X \n" $HeaderFileStatus # 0xAA effective 0xBB invalid
    printf "SequenceNO: %02X %02X \n" ${HeaderSequenceNO[1]} ${HeaderSequenceNO[2]}
    printf "TxnCnt: %02X %02X \n" ${HeaderTxnCnt[1]} ${HeaderTxnCnt[2]}
    printf "DateTime: %02X%02X-%02X-%02X %02X:%02X:%02X \n" \
                      ${HeaderDateTime[1]} ${HeaderDateTime[2]} ${HeaderDateTime[3]} ${HeaderDateTime[4]} ${HeaderDateTime[5]} ${HeaderDateTime[6]} ${HeaderDateTime[7]}
    printf "CollectFlag: %02X \n" $HeaderCollectFlag   # 0x00 not collected 0x01 collected
    printf "MachineCode: %c" ${HeaderMachineCode}   # char "M" for Machine
    printf "%02X%02X%02X " ${HeaderMachineNum[1]} ${HeaderMachineNum[2]} ${HeaderMachineNum[3]}
    printf "BusCode: %c" $HeaderBusCode #  "B" BV
    printf "%02X%02X%02X " ${HeaderBusNum[1]} ${HeaderBusNum[2]} ${HeaderBusNum[3]}
    printf "BusLineCode: %c" $HeaderBusLineCode # "L"  Bus Line, Bus APP
    printf "%02X%02X%02X \n" ${HeaderBusLineNum[1]} ${HeaderBusLineNum[2]} ${HeaderBusLineNum[3]}
    printf "DriverCode: %02X %02X %02X %02X " ${HeaderDriverCode[1]} ${HeaderDriverCode[2]} ${HeaderDriverCode[3]} ${HeaderDriverCode[4]}
    printf "RunCode: %02X %02X %02X %02X " ${HeaderRunCode[1]} ${HeaderRunCode[2]} ${HeaderRunCode[3]} ${HeaderRunCode[4]}
    # printf "RFU44[44]=0;"
    printf "FileType: %c%c%c%c \n" ${HeaderFileType[1]} ${HeaderFileType[2]} ${HeaderFileType[3]} ${HeaderFileType[4]} # "R""E""C""."
    
done

# Print the transaction records table.
printf "_________________________________________________________________________________"
printf "___________________________________________________________________________"
printf "_________________________________________________________________________________\n"

printf "Index:|" $txn_index
printf "Type:|"$txn_type
printf "SAMCAN:                 |" ${SamCan[1]} ${SamCan[2]} ${SamCan[3]} ${SamCan[4]} ${SamCan[5]} ${SamCan[6]} ${SamCan[7]} ${SamCan[8]}
printf "CardCAN:                |"${CardCan[1]} ${CardCan[2]} ${CardCan[3]} ${CardCan[4]} ${CardCan[5]} ${CardCan[6]} ${CardCan[7]} ${CardCan[8]}
printf "SamCTC:  |"${SamCTC[1]} ${SamCTC[2]} ${SamCTC[3]}
printf "UsrCTC:|"${UsrCTC[1]} ${UsrCTC[2]}
printf "tTP:|"$tTP
printf "TxnTime:            |"${TxnTime[1]} ${TxnTime[2]} ${TxnTime[3]} ${TxnTime[4]} ${TxnTime[5]} ${TxnTime[6]} ${TxnTime[7]}
printf "BalanceBefore:|"${BalanceBefore[1]} ${BalanceBefore[2]} ${BalanceBefore[3]} ${BalanceBefore[4]}
printf "Amount:     |"${Amount[1]} ${Amount[2]} ${Amount[3]} ${Amount[4]}
printf "Tcert:      |"${Tcert[1]} ${Tcert[2]} ${Tcert[3]} ${Tcert[4]}
printf "Dcert:      |"${Dcert[1]} ${Dcert[2]} ${Dcert[3]} ${Dcert[4]}
printf "StationON:|"${StationON[1]} ${StationON[2]} ${StationON[3]}
printf "StationOFF:|"${StationOFF[1]} ${StationOFF[2]} ${StationOFF[3]}
printf "TapInTime:        |"${TapInTime[1]} ${TapInTime[2]} ${TapInTime[3]} ${TapInTime[4]} ${TapInTime[5]} ${TapInTime[6]}
printf "lct:|"$lct
printf "TP:|"$TP
printf "RFU:     |"${RFU[1]} ${RFU[2]} ${RFU[3]}
printf "TripCounter_4:|\n"$TripCounter_4

# -- Restart scan ?
#n=0

while [[ $n -lt $num ]]
do
        txn_type=$(od -An -j $n -N 1 -t d $txnfile) && ((n+=1))
        
        SamCan[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[5]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[6]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[7]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCan[8]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        CardCan[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[5]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[6]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[7]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        CardCan[8]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        SamCTC[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCTC[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        SamCTC[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        UsrCTC[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        UsrCTC[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        tTP=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        TxnTime[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TxnTime[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TxnTime[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TxnTime[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TxnTime[5]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TxnTime[6]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TxnTime[7]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        BalanceBefore[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        BalanceBefore[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        BalanceBefore[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        BalanceBefore[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        Amount[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Amount[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Amount[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Amount[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        Tcert[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Tcert[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Tcert[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Tcert[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        Dcert[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Dcert[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Dcert[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        Dcert[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        StationON[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        StationON[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        StationON[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        StationOFF[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        StationOFF[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        StationOFF[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        TapInTime[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TapInTime[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TapInTime[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TapInTime[4]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TapInTime[5]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        TapInTime[6]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        lct=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        TP=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        RFU[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        RFU[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        RFU[3]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
        TripCounter_4=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))

        #printf "****************************************************************\n"
        printf "%02d    |" $txn_index
        printf "%02X   |"$txn_type
        printf "%02X %02X %02X %02X %02X %02X %02X %02X |" ${SamCan[1]} ${SamCan[2]} ${SamCan[3]} ${SamCan[4]} ${SamCan[5]} ${SamCan[6]} ${SamCan[7]} ${SamCan[8]}
        printf "%02X %02X %02X %02X %02X %02X %02X %02X |"${CardCan[1]} ${CardCan[2]} ${CardCan[3]} ${CardCan[4]} ${CardCan[5]} ${CardCan[6]} ${CardCan[7]} ${CardCan[8]}
        printf "%02X %02X %02X |"${SamCTC[1]} ${SamCTC[2]} ${SamCTC[3]}
        printf "%02X %02X  |"${UsrCTC[1]} ${UsrCTC[2]}
        printf "%02X  |"$tTP
        printf "%02X%02X %02X-%02X %02X:%02X:%02X |"${TxnTime[1]} ${TxnTime[2]} ${TxnTime[3]} ${TxnTime[4]} ${TxnTime[5]} ${TxnTime[6]} ${TxnTime[7]}
        printf "%02X %02X %02X %02X   |"${BalanceBefore[1]} ${BalanceBefore[2]} ${BalanceBefore[3]} ${BalanceBefore[4]}
        printf "%02X %02X %02X %02X |"${Amount[1]} ${Amount[2]} ${Amount[3]} ${Amount[4]}
        printf "%02X %02X %02X %02X |"${Tcert[1]} ${Tcert[2]} ${Tcert[3]} ${Tcert[4]}
        printf "%02X %02X %02X %02X |"${Dcert[1]} ${Dcert[2]} ${Dcert[3]} ${Dcert[4]}
        printf "%02X %02X %02X  |"${StationON[1]} ${StationON[2]} ${StationON[3]}
        printf "%02X %02X %02X   |"${StationOFF[1]} ${StationOFF[2]} ${StationOFF[3]}
        printf "%02X %02X %02X %02X %02X %02X |"${TapInTime[1]} ${TapInTime[2]} ${TapInTime[3]} ${TapInTime[4]} ${TapInTime[5]} ${TapInTime[6]}
        printf "%02X  |"$lct
        printf "%02X |"$TP
        printf "%02X %02X %02X |"${RFU[1]} ${RFU[2]} ${RFU[3]}
        printf "%02X            |\n"$TripCounter_4
        
        let txn_index=$txn_index+1
        # todo Lsam or Psam CAN
done

printf "\--------------------------------------------------------------------------------"
printf "\--------------------------------------------------------------------------"
printf "\--------------------------------------------------------------------------------\n"

