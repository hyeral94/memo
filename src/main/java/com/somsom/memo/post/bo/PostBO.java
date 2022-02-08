package com.somsom.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.memo.common.FileManagerService;
import com.somsom.memo.post.dao.PostDAO;
import com.somsom.memo.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String subject, String content, MultipartFile file) {
		
		// 파일을 컴퓨터(서버)에 저장하고, 클라이언트(브라우저)가 접근 가능한 주소를 만들어낸다.
		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, subject, content, filePath);
	}
	
	public List<Post> getPostList(int userId){
		return postDAO.selectPostList(userId);
		
	}
	
	public Post getPost(int postId) {
		return postDAO.selectPost(postId);
	}
	
	public int deletePost(int poistId) {
		
		Post post = postDAO.selectPost(poistId);
		FileManagerService.removeFile(post.getImagePath());
		
		return postDAO.deletePost(poistId);
	}
}
