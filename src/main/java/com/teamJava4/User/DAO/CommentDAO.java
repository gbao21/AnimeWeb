package com.teamJava4.User.DAO;

import java.util.List;

public interface CommentDAO<E, K> {
	Boolean createComment(E entity);
	Boolean updateComment (E entity);
	E findCommentByID(E entity);
	Boolean deleteComment (E entity);
	List<E> findAllByVideoID(E entity);
}
