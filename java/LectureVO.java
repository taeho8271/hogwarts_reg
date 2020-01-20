package edu.hogwarts.hogwartsreg.vo;

public class LectureVO {
	
	private int sub_code; // 과목코드
	private String stu_id; // 학번
	
	public LectureVO() {}

	public int getSub_code() {
		return sub_code;
	}

	public void setSub_code(int sub_code) {
		this.sub_code = sub_code;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	@Override
	public String toString() {
		return "LectureVO [sub_code=" + sub_code + ", stu_id=" + stu_id + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((stu_id == null) ? 0 : stu_id.hashCode());
		result = prime * result + sub_code;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LectureVO other = (LectureVO) obj;
		if (stu_id == null) {
			if (other.stu_id != null)
				return false;
		} else if (!stu_id.equals(other.stu_id))
			return false;
		if (sub_code != other.sub_code)
			return false;
		return true;
	}
	
}
