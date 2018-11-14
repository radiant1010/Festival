package com.yg.festival.common;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.Date;

import com.google.gson.Gson;
import com.yg.festival.common.bean.PushMsgBean;

public class FCMSender {

	public static final String FCM_SEND_URL = "https://fcm.googleapis.com/fcm/send";
	public static final String SERVER_API_KEY = "AAAA9DZvBWs:APA91bGy-ZyMgPgYZBfZvbHbWlDZzu-POVLAQAllOBK24OxJBz8G8BmmlrGh50VdEa6Q4L8-4Js9XJFI5AuZ8UMoZKMiGGLmgenzozrN5T5YyHsm8LMCXolS3OuPblDI-s6nptOg3zCT";
	
	/** 푸시 발송 - 1건 발송 **/
	public static boolean sendPushMsg(PushMsgBean msgBean) {

		System.out.println("start push scheduler... " + new Date());
		
		HttpURLConnection conn = null;
		boolean resBol = false;
		
		try {
			URL url = new URL(FCM_SEND_URL);
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());//현재시간
			
			//ready Connection
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			conn.setRequestProperty("Authorization", "key=" + SERVER_API_KEY);
			
			//make send Data Object
			msgBean.getData().setTime(timestamp.toString());
			
			//make json
			Gson gson = new Gson();
			String input = gson.toJson(msgBean);

			System.out.println(input);

//TODO 아래와 같이 전송할 JSON 형식이 만들어져야함.			
//			{ 
//				  "collapse_key": "score_update",
//				  "time_to_live": 108,
//				  "delay_while_idle": true,
//				  "data": {
//				    "score": "4x8",
//				    "time": "15:16.2342"
//				  },
//				  "to" : "bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1..."
//			}

			//Send JSON
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes("utf-8"));
			os.flush();

			//response json
			BufferedReader br = null;
			if (conn.getResponseCode() >= 400) {
	            br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
			} else {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
				resBol = true;
			}
			
			StringBuffer respStr = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				respStr.append(line);
	        }
			
			System.out.println(respStr + "\n");
			
			if(conn != null) {
				conn.disconnect();	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				conn.disconnect();	
			}
		}
		
		return resBol;
	}

}
