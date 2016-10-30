package com.hyunjae.noitamina;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.*;

public class Anitoday {

    private static Document connect(String url) {

        Document doc = null;
        try {
            doc = Jsoup
                    .connect(url)
                    .userAgent("Mozilla/5.0")
                    .get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return doc;

    }

    private static List<Item> getItems(Elements elements) {
        List<Item> items = new LinkedList<>();
        elements.forEach(element -> {
            Item item = new Item();
            item.setTitle(element.attr("title"));
            item.setUrl(element.attr("abs:href"));
            item.setSrc(element.select("img[src]").first().attr("src"));
            items.add(item);
        });
        return items;
    }

    private static List<Item> list(String url) {

        Document doc = connect(url);
        Elements elements = doc.select("a[href*=view]");
        return getItems(elements);

    }

    public static List<Item> now() {

        Document doc = connect("http://ani.today");
        Elements elements = doc.select(".enter-list-entity a[href]");
        return getItems(elements);

    }

    public static List<Item> lists(String url) {

        List<Item> items = new LinkedList<>();
        List<Item> tempItems;
        int page = 1;
        while((tempItems = list(url + "/" + page)).size() != 0) {
            items.addAll(tempItems);
            page++;
        }
        return items;

    }

    public static List<Item> search(String keyword) {

        String _keyword = encode(keyword);
        List<Item> items = new LinkedList<>();
        all().forEach(item -> {
            String _title = encode(item.getTitle());
            if(_title.contains(_keyword)){
                items.add(item);
            }
        });
        return items;

    }

    private static String encode(String s) {
        String _s = s.replace(" ", "");
        _s = _s.toUpperCase();
        return _s;
    }

    public static List<Item> all() {

        Document doc = connect("http://ani.today/");
        Elements elements = doc.select("div.category a[href~=list/\\d{2,}]");
        List<Item> items = new LinkedList<>();
        elements.forEach(element -> items.add(new Item(element.text(), element.attr("abs:href"), "")));
        return items;

    }

    public static Item video(String url) {

        Document doc = connect(url);
        String _title = doc.select("meta[property=og:title]").first().attr("content");
        String _url = doc.select("source[src]").first().attr("src");
        String _src =  doc.select("meta[property=og:image]").first().attr("content");
        return new Item(_title, _url, _src);

    }

}
