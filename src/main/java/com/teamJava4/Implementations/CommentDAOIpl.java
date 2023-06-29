package com.teamJava4.Implementations;

import java.util.List;

import com.teamJava4.Entity.Comments;
import com.teamJava4.Entity.Video;
import com.teamJava4.User.DAO.CommentDAO;
import com.teamJava4.User.DAO.SystemDAO;

public class CommentDAOIpl extends SystemDAO<Comments> implements CommentDAO<Comments, Long> {

	@Override
	public Boolean createComment(Comments entity) {
		
		return super.create(entity);
	}

	@Override
	public Boolean updateComment(Comments entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

	@Override
	public Boolean deleteComment(Comments entity) {
		return super.delete(entity);
	}

	@Override
	public  List<Comments> findAllByVideoID(Comments entity) {
		String jpql = "select o from Comments o where video_id =?0";
		return super.findMany(Comments.class, jpql, entity.getVideo().getVideo_id());
	}
	@Override
	public Comments findCommentByID(Comments entity) {
		String jpql = "select o from Comments o where o.comment_id=?0 and o.user.customer_id=?1";
		return super.findOne(Comments.class,jpql, entity.getComment_id(), entity.getUser().getCustomer_id());
	}
	
	public static void main(String[] args) {

	
	}

}
