package org.common.model;

public class FileVO {//IMAGE\이야기 시리즈\이야기\1.0

	private String fileName;
	private int fileSize;
	private String fileType;
	private String series;
	private String bookversion;
	private String pageNo;
	private String path;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getBookversion() {
		return bookversion;
	}
	public void setBookversion(String bookversion) {
		this.bookversion = bookversion;
	}
	
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "FileVO [fileName=" + fileName + ", fileSize=" + fileSize
				+ ", fileType=" + fileType + ", series=" + series
				+ ", bookversion=" + bookversion + ", pageNo=" + pageNo
				+ ", path=" + path + "]";
	}
	
}
