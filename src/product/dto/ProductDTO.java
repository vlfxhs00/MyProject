package product.dto;

public class ProductDTO {
	private int idx;
	private String p_name;
	private int price;
	private int amount;
	private String intro;
	private String img;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "ProductDTO [idx=" + idx + ", p_name=" + p_name + ", price=" + price + ", amount=" + amount + ", intro="
				+ intro + ", img=" + img + "]";
	}
	public ProductDTO() {
		
	}
	public ProductDTO(int idx, String p_name, int price, int amount, String intro, String img) {
		super();
		this.idx = idx;
		this.p_name = p_name;
		this.price = price;
		this.amount = amount;
		this.intro = intro;
		this.img = img;
	}
	
	
	
	
}
