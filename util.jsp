<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="java.util.Comparator" %>
<%!
    private static final String PROFILE_DIR = "ProfileDir";
    private static final String HOME_DIR = "HomeDir";

    private static final java.util.regex.Pattern VALID_NAME = java.util.regex.Pattern.compile("[A-Za-z0-9_-]+");

    public static boolean isValidName(String name) {
        return name != null && VALID_NAME.matcher(name).matches();
    }

    public static String requireValidName(String name) {
        if (!isValidName(name)) {
            throw new IllegalArgumentException("Invalid profile name");
        }
        return name;
    }

    // A single path component: no separators, no "." or "..", no control characters.
    public static boolean isValidFileName(String fileName) {
        if (fileName == null || fileName.isEmpty() || fileName.equals(".") || fileName.equals("..")) {
            return false;
        }
        for (int i = 0; i < fileName.length(); i++) {
            char c = fileName.charAt(i);
            if (c == '/' || c == '\\' || c < 0x20 || c == 0x7f) {
                return false;
            }
        }
        return true;
    }

    public static String requireValidFileName(String fileName) {
        if (!isValidFileName(fileName)) {
            throw new IllegalArgumentException("Invalid file name");
        }
        return fileName;
    }

    // Escapes a value for use in HTML text and quoted attribute values. null becomes "".
    public static String esc(Object value) {
        if (value == null) {
            return "";
        }
        String s = value.toString();
        StringBuilder sb = new StringBuilder(s.length() + 16);
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '&': sb.append("&amp;"); break;
                case '<': sb.append("&lt;"); break;
                case '>': sb.append("&gt;"); break;
                case '"': sb.append("&quot;"); break;
                case '\'': sb.append("&#39;"); break;
                default: sb.append(c);
            }
        }
        return sb.toString();
    }

    public static boolean isAdmin(javax.servlet.http.HttpSession session) {
        return "admin".equals(session.getAttribute("admin"));
    }

    public class Store {
        String profileDir;
        String homeDir;
        String adminPassword;

        public Store(ServletContext application) throws IOException {
            Properties p = loadProperties(new File(application.getRealPath("/WEB-INF/exportgui.properties")));
            profileDir = p.getProperty(PROFILE_DIR);
            homeDir = p.getProperty(HOME_DIR);
            adminPassword = p.getProperty("password");
        }

        public Properties loadProfile(String name) throws IOException {
            return loadProperties(getProfileFile(name));
        }

        void storeProfile(Properties profile) throws IOException {
            String name = profile.getProperty("name");
            storeProperties(profile, getProfileFile(name));
        }

        public Map loadAllProfiles() throws IOException {
            File files[] = getProfilesDir().listFiles();

            Map<String, Properties> profiles = new TreeMap<String, Properties>(new Comparator<String>() {
                @Override
                public int compare(String s1, String s2) {
                    return s1 != null ? s1.compareToIgnoreCase(s2) : 0;
                }
            });

            for (File f : files) {
                if (f.getName().endsWith(".properties")) {
                    Properties profile = loadProperties(f);
                    profiles.put(profile.getProperty("longname"), profile);
                }
            }

            return profiles;
        }

        public void storeJob(Properties job) throws IOException {
            requireValidName(job.getProperty("name"));
            String jobId = "" + (int) (Math.random() * 1000000);
            storeProperties(job, getJobFile(jobId));
        }

        public File getProfileFile(String profileName) {
            return new File(getProfilesDir(), requireValidName(profileName) + ".properties");
        }

        public File getProfilesDir() {
            return new File(profileDir);
        }

        public File getJobFile(String jobId) {
            return new File(getJobsDir(), requireValidFileName(jobId));
        }

        public File getJobsDir() {
            return new File(homeDir + "/jobs/incoming");
        }

        public File getExportDir(String profileName) {
            return new File(homeDir + "/files/" + requireValidName(profileName) + "/marc");
        }

        public File getLogDir(String profileName) {
            return new File(homeDir + "/files/" + requireValidName(profileName) + "/logs");
        }

        public String getAdminPassword() {
            return adminPassword;
        }
    }

    public Store getStore(ServletContext application) throws IOException {
        return new Store(application);
    }

    public static Properties loadProperties(File file) throws IOException {
        Properties properties = new Properties();

        InputStream input = new FileInputStream(file);
        try {
            properties.load(input);
        } finally {
            input.close();
        }

        return properties;
    }

    private static void storeProperties(Properties properties, File file) throws IOException {
        OutputStream output = new FileOutputStream(file);
        try {
            properties.store(output, null);
        } finally {
            output.close();
        }
    }
%>
