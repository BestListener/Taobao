package cn.edu.zhku.she.Model;

public class Book extends Product{
	private String bookName;
	private String publishName;
	private String publishDate;
	private String author;
	private String bookPage;
	public Book()
	{
		super();
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getPublishName() {
		return publishName;
	}
	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBookPage() {
		return bookPage;
	}
	public void setBookPage(String bookPage) {
		this.bookPage = bookPage;
	}
}
