package com.kh.young.shopping.dto;

import com.kh.young.model.vo.OrderDetails;
import com.kh.young.model.vo.Orders;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class OrderListDTO {
	private Orders orders;
	private OrderDetails orderDetails;
}
