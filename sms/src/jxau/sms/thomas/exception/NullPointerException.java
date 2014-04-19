package jxau.sms.thomas.exception;

public class NullPointerException extends RuntimeException {

	/**
	 * 处理空指针异常，包括查询条件为空、对象序列为空等等
	 */
	private static final long serialVersionUID = 1L;
	public NullPointerException(String message) {
		// TODO Auto-generated constructor stub
		super(message);
	}
}
