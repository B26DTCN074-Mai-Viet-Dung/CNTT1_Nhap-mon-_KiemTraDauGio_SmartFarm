write-output "==================" > ..\backup\bao-cao-su-co.txt
write-output " BAO CAO SU CO - SMARTFARM " "Ngay gio $(get-date)" >> ..\backup\bao-cao-su-co.txt
write-output "==================" >> ..\backup\bao-cao-su-co.txt
gc ..\data\log-he-thong.log | select-string "ERROR|CRITICAL"  >>..\backup\bao-cao-su-co.txt
write-output "TONG SO SU CO: " >> ..\backup\bao-cao-su-co.txt
(gc ..\data\log-he-thong.log | select-string "ERROR|CRITICAL" | measure-object).count >>..\backup\bao-cao-su-co.txt

