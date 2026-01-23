# Screen shot ของแอพ
![หน้า Product-list](https://github.com/user-attachments/assets/63522ab1-f2b1-4d47-b7dd-17239a270ac5)
![หน้า Product-list (call api error)](https://github.com/user-attachments/assets/d63f631a-f7be-4739-90d1-ac9289fa0362)
![หน้า Product-detail](https://github.com/user-attachments/assets/61fa88f1-96d2-4ddd-bbbe-a2d3e53e0639)


## วิธีการจัดการ State

ด้วยเนื่องจากแอพลิเคชั่นมีแค่ 2 หน้าจึงไม่ได้ใช้ Provider เข้ามาช่วยจัดการ แต่เลือกใช้การส่งข้อมูลระหว่างหน้า
โดยมีเรียก Api ในหน้า Product List โดยใช้ FutureBuilder มาจัดการสถานะระหว่างการ call api (success,loading,error) เพื่อที่จะแสดง Ui ที่แตกต่างกันออกไป

## ใช้ AI มาช่วยทำส่วนไหนบ้าง

1. ในส่วน Carousal - รายละเอียด product ให้ ai ช่วยแนะนำ libraries ของ carousal โดยยื่นเรฟรูปแบบที่เราอยากได้ไป
2. หาวิธีทำให้ FutureBuilder ยิง api อีกที หากกด ปุ่ม Refresh ในหน้า call-error-api - Product List 
