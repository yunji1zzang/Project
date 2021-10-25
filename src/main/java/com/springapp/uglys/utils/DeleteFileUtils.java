package com.springapp.uglys.utils;

import java.io.File;

public class DeleteFileUtils {
	// 파일 삭제 테스트
//	public static void main(String[] args) {
//		DeleteFileUtils utils = new DeleteFileUtils();
//		
//		utils.deleteFiles("C:\\Users\\user\\git\\uglys\\src\\main\\webapp\\resources\\imgUpload\\2021\\10\\14\\09db291a-f5b5-4440-8573-f40f3c65bc2c_flower_03.jpg");
//	}
//	
	public boolean  deleteFiles(String filePath) {
		
		
		File file = new File(filePath);
		if(file.exists()){ // 파일존재여부확인
			if (file.isDirectory()) {
				// 파일이 디렉토리인지 확인
				File[] files = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					if (files[i].delete()) {
						System.out.println(files[i].getName() + " 삭제성공");
						return true;
					} else {
						System.out.println(files[i].getName() + " 삭제실패");
						return false;
					}
				}
			}
			if (file.delete()) {
				System.out.println("파일삭제 성공");
				return true;
			} else {
				System.out.println("파일삭제 실패");
				return false;
			}
		}else
		{
			System.out.println("파일이 존재하지 않습니다.");
			return false;
		}
		
	}
	
}
