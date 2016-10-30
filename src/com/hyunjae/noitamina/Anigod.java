package com.hyunjae.noitamina;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Anigod {

    private static Document connect(String url) {

        Document doc = null;
        try {
            doc = Jsoup.connect(url)
                    .userAgent("Mozilla/5.0")
                    .referrer("http://sh.st/")
                    .get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return doc;

    }

    public static List<Item> list(String url) {

        Document doc = connect(url);

        List<Item> items = new LinkedList<>();

        Elements elements = doc.select(".table-image-container");
        elements.forEach(element -> {
            Item item = new Item();
            item.setTitle(element.attr("title"));
            item.setUrl(element.attr("abs:href"));
            item.setSrc(element.select(".lazy").first().attr("data-original"));
            items.add(item);
        });

        return items;

    }

    public static List<Item> search(String keyword) {

        String keywordEscaped = keyword.replace(" ", "%20");
        return list("https://anigod.com/animations/search/" + keywordEscaped);

    }
    
    public static Map<String, List<Item>> now() {

        Document doc = connect("https://anigod.com/");
        Elements elements = doc.select(".index-table-container");

        Map<String, List<Item>> map = new LinkedHashMap<>();
        map.put("Mon", new LinkedList<>());
        map.put("Tue", new LinkedList<>());
        map.put("Wed", new LinkedList<>());
        map.put("Thu", new LinkedList<>());
        map.put("Fri", new LinkedList<>());
        map.put("Sat", new LinkedList<>());
        map.put("Sun", new LinkedList<>());

        long currentTime = System.currentTimeMillis()/1000;

        int index = 0;
        for(List<Item> items : map.values()) {
            if(index > 6) break;
            elements.get(index).select(".index-image-container.badge").forEach(element -> {
                Item item = new Item(element.attr("title")
                        , element.attr("abs:href")
                        , element.select(".index-image").first().attr("src"));
                long timestamp = Long.parseLong(element.attr("timestamp"));
                if (currentTime - timestamp < 60 * 60 * 24) {
                    item.setNew(true);
                }
                items.add(item);
            });
            index++;
        }

        return map;

    }

    public static Item video(String url) {

        Document doc = connect(url);
        Element element = doc.select("img[src]").first();
        String _title = element.attr("alt");
        String _src = element.attr("src");
        String html = doc.outerHtml();

        String videoID = "";
        Pattern pattern = Pattern.compile("var videoID = '(.*?)'");
        Matcher matcher = pattern.matcher(html);
        if(matcher.find()) {
            videoID = matcher.group(1);
        }

        String videoIDEscaped = null;
        try {
            videoIDEscaped = URLDecoder.decode(videoID, "UTF-8")
                    .replace("\\x", "%")
                    .replace("\\", "");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String _url = "https://anigod.com/video?id=" + videoIDEscaped + "&ts=" + System.currentTimeMillis();

        return new Item(_title, _url, _src);
        
    }

}