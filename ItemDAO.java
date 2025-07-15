package com.sims;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    public void addItem(String name, int quantity, int threshold) throws SQLException {
        String sql = "INSERT INTO inventory (name, quantity, threshold) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, quantity);
            ps.setInt(3, threshold);
            ps.executeUpdate();
        }
    }

    public void updateItemQuantity(int id, int quantity) throws SQLException {
        String sql = "UPDATE inventory SET quantity = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, id);
            ps.executeUpdate();
        }
    }

    public List<Item> getAllItems() throws SQLException {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT id, name, quantity, threshold FROM inventory";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                items.add(new Item(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getInt("quantity"),
                    rs.getInt("threshold")
                ));
            }
        }
        return items;
    }

    public Item getItem(int id) throws SQLException {
        String sql = "SELECT id, name, quantity, threshold FROM inventory WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Item(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getInt("threshold")
                    );
                }
            }
        }
        return null;
    }
}
