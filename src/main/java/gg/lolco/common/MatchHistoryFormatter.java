package gg.lolco.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

public class MatchHistoryFormatter {
	private static final String BLUE_SIDE = "blueSide";
	private static final String RED_SIDE = "redSide";
	private static final String TOP = "Top";
	private static final String JUNGLE = "Jungle";
	private static final String MID = "Mid";
	private static final String BOT = "Bot";
	private static final String SUPPORT = "Support";

	public static List<Map<String, Object>> format(List<List<String[]>> setResults, 
													String separator) 
	{
		final List<Map<String, Object>> matchHistoryFormatted = new ArrayList<>();
		
		setResults.forEach(setResult -> {
			final Map<String, Object> setResultFormatted = new HashMap<>();
			
			IntStream.range(0, setResult.size()).forEach(index -> {
				final String[] row = setResult.get(index);
				
				switch (index) {
				case 0:
					updateSummary(setResultFormatted, BLUE_SIDE, row);
					break;
				case 1:
					updateBannedChamps(setResultFormatted, BLUE_SIDE, row);
					break;
				case 2:
					updateSummary(setResultFormatted, RED_SIDE, row);
					break;
				case 3:
					updateBannedChamps(setResultFormatted, RED_SIDE, row);
					break;
				case 4:
					updatePlayer(setResultFormatted, BLUE_SIDE, TOP, row);
					break;
				case 5:
					updateChamp(setResultFormatted, BLUE_SIDE, TOP, row);
					break;
				case 6:
					updateStats(setResultFormatted, BLUE_SIDE, TOP, row);
					break;
				case 7:
					updatePlayer(setResultFormatted, BLUE_SIDE, JUNGLE, row);
					break;
				case 8:
					updateChamp(setResultFormatted, BLUE_SIDE, JUNGLE, row);
					break;
				case 9:
					updateStats(setResultFormatted, BLUE_SIDE, JUNGLE, row);
					break;
				case 10:
					updatePlayer(setResultFormatted, BLUE_SIDE, MID, row);
					break;
				case 11:
					updateChamp(setResultFormatted, BLUE_SIDE, MID, row);
					break;
				case 12:
					updateStats(setResultFormatted, BLUE_SIDE, MID, row);
					break;
				case 13:
					updatePlayer(setResultFormatted, BLUE_SIDE, BOT, row);
					break;
				case 14:
					updateChamp(setResultFormatted, BLUE_SIDE, BOT, row);
					break;
				case 15:
					updateStats(setResultFormatted, BLUE_SIDE, BOT, row);
					break;
				case 16:
					updatePlayer(setResultFormatted, BLUE_SIDE, SUPPORT, row);
					break;
				case 17:
					updateChamp(setResultFormatted, BLUE_SIDE, SUPPORT, row);
					break;
				case 18:
					updateStats(setResultFormatted, BLUE_SIDE, SUPPORT, row);
					break;
				case 19:
					updatePlayer(setResultFormatted, RED_SIDE, TOP, row);
					break;
				case 20:
					updateChamp(setResultFormatted, RED_SIDE, TOP, row);
					break;
				case 21:
					updateStats(setResultFormatted, RED_SIDE, TOP, row);
					break;
				case 22:
					updatePlayer(setResultFormatted, RED_SIDE, JUNGLE, row);
					break;
				case 23:
					updateChamp(setResultFormatted, RED_SIDE, JUNGLE, row);
					break;
				case 24:
					updateStats(setResultFormatted, RED_SIDE, JUNGLE, row);
					break;
				case 25:
					updatePlayer(setResultFormatted, RED_SIDE, MID, row);
					break;
				case 26:
					updateChamp(setResultFormatted, RED_SIDE, MID, row);
					break;
				case 27:
					updateStats(setResultFormatted, RED_SIDE, MID, row);
					break;
				case 28:
					updatePlayer(setResultFormatted, RED_SIDE, BOT, row);
					break;
				case 29:
					updateChamp(setResultFormatted, RED_SIDE, BOT, row);
					break;
				case 30:
					updateStats(setResultFormatted, RED_SIDE, BOT, row);
					break;
				case 31:
					updatePlayer(setResultFormatted, RED_SIDE, SUPPORT, row);
					break;
				case 32:
					updateChamp(setResultFormatted, RED_SIDE, SUPPORT, row);
					break;
				case 33:
					updateStats(setResultFormatted, RED_SIDE, SUPPORT, row);
					break;
				}
			});
			
			matchHistoryFormatted.add(setResultFormatted);
		});
		
		return matchHistoryFormatted;
	}
	
	private static void updateSummary(Map<String, Object> setResultFormatted, 
									String side, String[] row) 
	{
		setResultFormatted.put(side, row[0]);
		setResultFormatted.put(side + "Result", row[1]);
		setResultFormatted.put(side + "Kills", row[2]);
		setResultFormatted.put(side + "Towers", row[3]);
		setResultFormatted.put(side + "Dragons", row[4]);
		setResultFormatted.put(side + "Barons", row[5]);
		setResultFormatted.put(side + "RiftHeralds", row[6]);
	}
	
	private static void updateBannedChamps(Map<String, Object> setResultFormatted, 
											String side, String[] row) 
	{
		setResultFormatted.put(side + "Banned", row);
	}
	
	private static void updatePlayer(Map<String, Object> setResultFormatted, 
									String side, String position, 
									String[] row) 
	{
		setResultFormatted.put(side + position + "Player", String.join("", row));
	}
	
	private static void updateChamp(Map<String, Object> setResultFormatted, 
									String side, String position, 
									String[] row) 
	{
		setResultFormatted.put(side + position + "Champ", row[0]);
		setResultFormatted.put(side + position + "SpellOne", row[1]);
		setResultFormatted.put(side + position + "SpellTwo", row[2]);
		setResultFormatted.put(side + position + "Items", Arrays.copyOfRange(row, 3, row.length));
	}
	
	private static void updateStats(Map<String, Object> setResultFormatted, 
									String side, String position, 
									String[] row) 
	{
		setResultFormatted.put(side + position + "KdaTotal", row[0]);
		setResultFormatted.put(side + position + "KdaOverall", row[1]);
		setResultFormatted.put(side + position + "Cs", row[2]);
		setResultFormatted.put(side + position + "CsM", row[3]);
		setResultFormatted.put(side + position + "Gold", row[4]);
		setResultFormatted.put(side + position + "Damage", row[5]);
	}
	
	public static List<Map<String, Object>> runeFormat(List<List<String[]>> setResults, String separator)
	{

		final List<Map<String, Object>> matchHistoryRuneFormatted = new ArrayList<>();
		
		setResults.forEach((setResult) -> {
			final Map<String, Object> setResultFormatted = new HashMap<>();
			
			IntStream.range(0, setResult.size()).forEach(index -> {
				final String[] row = setResult.get(index);
				
				switch(index) {
					case 0:
						updateRune(setResultFormatted, BLUE_SIDE, TOP, row);
						break;
					case 1:
						updateRune(setResultFormatted, BLUE_SIDE, JUNGLE, row);
						break;
					case 2:
						updateRune(setResultFormatted, BLUE_SIDE, MID, row);
						break;
					case 3:
						updateRune(setResultFormatted, BLUE_SIDE, BOT, row);
						break;
					case 4:
						updateRune(setResultFormatted, BLUE_SIDE, SUPPORT, row);
						break;
					case 5:
						updateRune(setResultFormatted, RED_SIDE, TOP, row);
						break;
					case 6:
						updateRune(setResultFormatted, RED_SIDE, JUNGLE, row);
						break;
					case 7:
						updateRune(setResultFormatted, RED_SIDE, MID, row);
						break;
					case 8:
						updateRune(setResultFormatted, RED_SIDE, BOT, row);
						break;
					case 9:
						updateRune(setResultFormatted, RED_SIDE, SUPPORT, row);
						break;
				}
			});
			matchHistoryRuneFormatted.add(setResultFormatted);
		});
		return matchHistoryRuneFormatted;
	}
	
	private static void updateRune(Map<String, Object> setResultFormatted, String side, String position, String[] row) 
	{
		setResultFormatted.put(side + position, row[0]);
		setResultFormatted.put(side + position + "MainCategory", row[1]);
		setResultFormatted.put(side + position + "MainRune", row[3]);
		setResultFormatted.put(side + position + "MainRuneFirstRow", row[5]);
		setResultFormatted.put(side + position + "MainRuneSecondRow", row[7]);
		setResultFormatted.put(side + position + "MainRuneLastRow", row[11]);
		setResultFormatted.put(side + position + "SubCategory", row[2]);
		setResultFormatted.put(side + position + "SubRuneFirstRow", row[4]);
		setResultFormatted.put(side + position + "SubRuneLastRow", row[6]);
		setResultFormatted.put(side + position + "RunAttributeFirstRow", row[8]);
		setResultFormatted.put(side + position + "RunAttributeSecondRow", row[9]);
		setResultFormatted.put(side + position + "RunAttributeLastRow", row[10]);
	}
	
}
