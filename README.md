# Screen shot ของแอพ
![หน้า Product-list](https://drive.google.com/file/d/11yVZPU2MUnA2RDVwn1GZxEJBL5o71-ZF/view?usp=sharing)
![หน้า Product-list (call api error)](https://drive.google.com/file/d/1jboTy81cgia5-B4vj_t11iJwkCMMDvBL/view?usp=sharing)
![หน้า Product-detail](https://drive.google.com/file/d/15QlXQDndDx6gMySojmrESTrCqsY6TcGq/view?usp=sharing)

## วิธีการจัดการ State

ด้วยเนื่องจากแอพลิเคชั่นมีแค่ 2 หน้าจึงไม่ได้ใช้ Provider เข้ามาช่วยจัดการ แต่เลือกใช้การส่งข้อมูลระหว่างหน้า
โดยมีเรียก Api ในหน้า Product List โดยใช้ FutureBuilder มาจัดการสถานะระหว่างการ call api (success,loading,error) เพื่อที่จะแสดง Ui ที่แตกต่างกันออกไป

## ใช้ AI มาช่วยทำส่วนไหนบ้าง

1. ในส่วน Carousal - รายละเอียด product ให้ ai ช่วยแนะนำ libraries ของ carousal โดยยื่นเรฟรูปแบบที่เราอยากได้ไป
2. หาวิธีทำให้ FutureBuilder ยิง api อีกที หากกด ปุ่ม Refresh ในหน้า call-error-api - Product List 
