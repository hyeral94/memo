package com.somsom.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	//final : 한번 세팅된 값을 수정할 수 없게 만듦(final 변수는 대문자로 만들어야함.)
	public final String FILE_UPLOAD_PATH = "C:\\Users\\이민우\\Documents\\spring project\\upload\\image/";

	//파일저장
	public String saveFile(int userId, MultipartFile file) {
		
		//파일경로
		//사용자 별로 구분할 수 있도록
		//사용자가 파일을 올린 시간으로 구분
		// ex)12_33320493/text.png
		// currentTimeMillis : 1970년 1월 1일 기준으로 현재 미리 세컨이 얼마나 경과 되었는지 나타내는 수
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		//파일이 실제로 저장되는 장소
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		//디렉토리 생성
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			//디렉토리 생성 에러
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			//파일 저장 경로 + 파일 이름
			Path path = Paths.get(filePath + file.getOriginalFilename());
			//파일 저장
			Files.write(path, bytes);
		} catch (IOException e) {
			
			e.printStackTrace();		
			return null;
		}
		
		// 파일 접근 가능한 주소 리턴
		// <img src="/images/12_236475/test.png">
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
}
