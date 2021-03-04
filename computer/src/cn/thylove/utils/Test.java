package cn.thylove.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Test {

	public static void main(String[] args) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = df.format(new Date().getTime());
		String uuid = String.join("",UUID.randomUUID().toString().split("-"));
		String uuid1 = UUID.randomUUID().toString().replace("-", "").substring(16);
		
		System.out.println(uuid);
		System.out.println(uuid1);
	}

}
