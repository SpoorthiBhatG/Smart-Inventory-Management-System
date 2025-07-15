package com.sims;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

import java.io.File;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class InventoryStorage {

    private static InventoryStorage instance = new InventoryStorage();

    private ConcurrentHashMap<Integer, Item> items = new ConcurrentHashMap<>();
    private AtomicInteger idGenerator = new AtomicInteger(1);

    private final ObjectMapper mapper = new ObjectMapper();
    private final File storageFile = new File("inventory.json");

    private InventoryStorage() {
        loadFromFile();
    }

    public static InventoryStorage getInstance() {
        return instance;
    }

    public synchronized int addItem(String name, int quantity, int threshold) {
        int id = idGenerator.getAndIncrement();
        Item item = new Item(id, name, quantity, threshold);
        items.put(id, item);
        saveToFile();
        return id;
    }

    public Map<Integer, Item> getAllItems() {
        return items;
    }

   public synchronized void saveToFile() {
    try {
        mapper.writerWithDefaultPrettyPrinter().writeValue(storageFile, items);
    } catch (Exception e) {
        e.printStackTrace();
    }
}


    private void loadFromFile() {
        try {
            if (storageFile.exists()) {
                Map<Integer, Item> loadedItems = mapper.readValue(storageFile, new TypeReference<Map<Integer, Item>>() {});
                items.putAll(loadedItems);
                int maxId = loadedItems.keySet().stream().max(Integer::compareTo).orElse(0);
                idGenerator.set(maxId + 1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Item class
    public static class Item {
        public int id;
        public String name;
        public int quantity;
        public int threshold;

        public Item() {}

        public Item(int id, String name, int quantity, int threshold) {
            this.id = id;
            this.name = name;
            this.quantity = quantity;
            this.threshold = threshold;
        }
    }
}
