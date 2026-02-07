const ExportWarframes = require("../warframe-public-export-plus/ExportWarframes.json");
const getScaledPowersuitValues = require("../warframe-public-export-plus/supplementals/getScaledPowersuitValues.js");
const scaled_values_ground_truth = require("./scaled_values_ground_truth.json");

const joaat = (str) => {
	let hash = 0;
	for (let i = 0; i != str.length; ++i) {
		hash = (hash + str.charCodeAt(i)) >>> 0;
		hash = (hash + (hash << 10)) >>> 0;
		hash = (hash ^ (hash >>> 6)) >>> 0;
	}
	hash = (hash + (hash << 3)) >>> 0;
	hash = (hash ^ (hash >>> 11)) >>> 0;
	hash = (hash + (hash << 15)) >>> 0;
	return hash;
};

(async () => {
	for (const uniqueName of Object.keys(ExportWarframes)) {
		const gt = scaled_values_ground_truth[uniqueName];
		for (let rank = 0; rank != gt.length; ++rank) {
			const expected = gt[rank];
			const actual = await getScaledPowersuitValues(uniqueName, rank);
			if (expected.health != actual.health
				|| expected.shield != actual.shield
				|| expected.power != actual.power
				|| expected.armor != actual.armor
				|| expected.ability_strength != actual.ability_strength
				|| expected.heal_rate != actual.heal_rate
				) {
				console.log(`Mismatch for ${uniqueName} at rank ${rank}:`, { uniqueName_joaat: joaat(uniqueName), expected, actual });
				break;
			}
		}
	}
})();
