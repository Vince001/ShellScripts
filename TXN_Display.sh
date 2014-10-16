#!/bin/bash

# Vince 2014-10-16 Created.
# 1, Only for Loyalty debit transaction analysis.
# 2, The 256 bytes file header will not display.

echo "===============================================================>>"

txnfile=$1

if [ ! $txnfile ]; then
    echo "Not txn file!"
    exit 0
fi

num=$(cat $txnfile | wc -c)
let txn_cnt=($num-256)/64
echo "File size: $num ====> Txn counter: $txn_cnt"
echo ""

n=256
txn_index=1

#decalare -a sam_type_s
sam_type_s[2]="LSamCan"
sam_type_s[1]="PSamCan"
sam_type_s[2]="LSamCan"

SamCan[8]=0;
CardCan[8]=0;
SamCTC[3]=0;
JsrCTC[2]=0;
TxnTime[7]=0;
BalanceBefore[4]=0;
Amount[4]=0;
Tcert[4]=0;
Dcert[4]=0;
StationON[3]=0;
StationOFF[3]=0;
TapInTime[6]=0;
RFU[3]=0;

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
        
        JsrCTC[1]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        JsrCTC[2]=$(od -An -j $n -N 1 -s $txnfile) && ((n+=1))
        
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

        # echo $a","$b
        #echo "TxnType:"$a
        #printf "****************************************************************\n"
        printf "TXN Index: %02d |" $txn_index
        printf "TxnType: %02X |"$txn_type
        printf "SAMCAN: %02X %02X %02X %02X %02X %02X %02X %02X |" ${SamCan[1]} ${SamCan[2]} ${SamCan[3]} ${SamCan[4]} ${SamCan[5]} ${SamCan[6]} ${SamCan[7]} ${SamCan[8]}
        printf "CardCAN: %02X %02X %02X %02X %02X %02X %02X %02X |"${CardCan[1]} ${CardCan[2]} ${CardCan[3]} ${CardCan[4]} ${CardCan[5]} ${CardCan[6]} ${CardCan[7]} ${CardCan[8]}
        printf "SamCTC: %02X %02X %02X |"${SamCTC[1]} ${SamCTC[2]} ${SamCTC[3]}
        printf "JsrCTC: %02X %02X |"${JsrCTC[1]} ${JsrCTC[2]}
        printf "tTP: %02X |"$tTP
        printf "TxnTime: %02X %02X %02X %02X %02X %02X %02X |"${TxnTime[1]} ${TxnTime[2]} ${TxnTime[3]} ${TxnTime[4]} ${TxnTime[5]} ${TxnTime[6]} ${TxnTime[7]}
        printf "BalanceBefore: %02X %02X %02X %02X |"${BalanceBefore[1]} ${BalanceBefore[2]} ${BalanceBefore[3]} ${BalanceBefore[4]}
        printf "Amount: %02X %02X %02X %02X |"${Amount[1]} ${Amount[2]} ${Amount[3]} ${Amount[4]}
        printf "Tcert: %02X %02X %02X %02X |"${Tcert[1]} ${Tcert[2]} ${Tcert[3]} ${Tcert[4]}
        printf "Dcert: %02X %02X %02X %02X |"${Dcert[1]} ${Dcert[2]} ${Dcert[3]} ${Dcert[4]}
        printf "StationON: %02X %02X %02X |"${StationON[1]} ${StationON[2]} ${StationON[3]}
        printf "StationOFF: %02X %02X %02X |"${StationOFF[1]} ${StationOFF[2]} ${StationOFF[3]}
        printf "TapInTime: %02X %02X %02X %02X %02X %02X |"${TapInTime[1]} ${TapInTime[2]} ${TapInTime[3]} ${TapInTime[4]} ${TapInTime[5]} ${TapInTime[6]}
        printf "lct: %02X |"$lct
        printf "TP: %02X |"$TP
        printf "RFU: %02X %02X %02X |"${RFU[1]} ${RFU[2]} ${RFU[3]}
        printf "TripCounter_4: %02X |\n"$TripCounter_4
        
        let txn_index=$txn_index+1
        # Lsam or Psam CAN
        #echo "63 Bytes:"$b
done
